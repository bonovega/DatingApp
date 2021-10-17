using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using API.Data;
using API.DTOs;
using API.Entities;
using API.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    public class AccountController : BaseApiController
    {
        private readonly DataContext context;
        private readonly ITokenService tokenService;

        public AccountController(DataContext context, ITokenService tokenService)
        {
            this.context = context;
            this.tokenService = tokenService;
        }

        [HttpPost("register")]
        public async Task<ActionResult<UserDto>> Register(RegisterDto registerDto)
        {
            if(await UserExist(registerDto.Username)) return BadRequest("Username is Taken");

            using var hmac=new HMACSHA512();

            var user=new AppUser
            {
                UserName=registerDto.Username.ToLower(),
                Passwordhash=hmac.ComputeHash(Encoding.UTF8.GetBytes(registerDto.Password)),
                PasswordSalt=hmac.Key
            };

            context.Users.Add(user);

            await context.SaveChangesAsync();

            return new UserDto
            {
                Username=user.UserName,
                Token=tokenService.CreateToken(user)
            };
        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
        {
            var user=await context.Users.SingleOrDefaultAsync(u => u.UserName==loginDto.Username);

            if(user==null) return Unauthorized("Invalid username");

            using var hmac = new HMACSHA512(user.PasswordSalt);

            var computedHash=hmac.ComputeHash(Encoding.UTF8.GetBytes(loginDto.Password));

            for (int i = 0; i < computedHash.Length; i++)
            {
                if (computedHash[i] != user.Passwordhash[i]) return Unauthorized("Invalid password");
            }

            return new UserDto
            {
                Username=user.UserName,
                Token=tokenService.CreateToken(user)
            };
        }

        private async Task<bool> UserExist(string username)
        {
            return await this.context.Users.AnyAsync(u=>u.UserName==username.ToLower());
        }
    }
}
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using API.Entities;
using API.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace API.Services
{
    public class TokenService : ITokenService
    {
        private readonly SymmetricSecurityKey key;
        public TokenService(IConfiguration config)
        {
            key=new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"]));
        }

        public string CreateToken(AppUser user)
        {
            var claims=new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, user.UserName),
                new Claim(JwtRegisteredClaimNames.NameId, user.Id.ToString())
            };

             var creds= new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

             var tokenDescriptor=new SecurityTokenDescriptor
             {
                 Subject=new ClaimsIdentity(claims),
                 Expires=DateTime.Now.AddDays(7),
                 SigningCredentials=creds
             };

             var tokenHendler=new JwtSecurityTokenHandler();

             var token=tokenHendler.CreateToken(tokenDescriptor);

             return tokenHendler.WriteToken(token);
        }
    }
}
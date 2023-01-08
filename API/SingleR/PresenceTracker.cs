using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.SingleR
{
    public class PresenceTracker
    {
        private static readonly Dictionary<string, List<string>> OnlineUsers = new Dictionary<string, List<string>>();

        public Task UserConnected(string userName, string connectionId)
        {
            lock (OnlineUsers)
            {
                if (OnlineUsers.ContainsKey(userName))
                {
                    OnlineUsers[userName].Add(connectionId);
                }
                else
                {
                    OnlineUsers.Add(userName, new List<string> { connectionId });
                }
            }

            return Task.CompletedTask;
        }
        public Task UserDisconnected(string userName, string connectionId)
        {
            lock (OnlineUsers)
            {
                if (!OnlineUsers.ContainsKey(userName)) return Task.CompletedTask;

                OnlineUsers[userName].Remove(connectionId);

                if (!OnlineUsers[userName].Any())
                {
                    OnlineUsers.Remove(userName);
                }
            }
            return Task.CompletedTask;
        }
        public Task<string[]> GetAllUsers()
        {
            string[] onlineUsers;

            lock (OnlineUsers)
            {
                 onlineUsers=OnlineUsers.OrderBy(k=>k.Key).Select(k=>k.Key).ToArray();
            }

            return Task.FromResult(onlineUsers);
        }
    }
}
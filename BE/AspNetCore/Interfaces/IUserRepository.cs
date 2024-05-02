﻿using PixelPalette.Entities;
using PixelPalette.Helpers;
using PixelPalette.Models;

namespace PixelPalette.Interfaces
{
    public interface IUserRepository
    {
        Task<IEnumerable<UserModel>> GetAllUsersAsync();
        Task<UserModel> GetUserByIdAsync(int id);
        Task<UserModel> UpdateProfileAsync(int id, ProfileParams entryParams);
        Task<UserModel> UpdateAccountAsync(int id, AccountParams entryParams);
        Task<bool> DeleteUserAsync(int id);
        Task<string> EditAvatarAsync(int id, IFormFile file);
        Task<bool> FollowHandleAsync(int id, int followingId);
        Task<bool> UnfollowHandleAsync(int id, int followingId);
    }
}

﻿
using AutoMapper;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using PixelPalette.Data;
using PixelPalette.Entities;
using PixelPalette.Helpers;
using PixelPalette.Interfaces;
using PixelPalette.Models;

namespace PixelPalette.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly PixelPaletteContext _context;
        private readonly IMapper _mapper;
        private readonly IPhotoService _photoService;
        private readonly ITool _tools;

        public UserRepository(PixelPaletteContext context, IMapper mapper, IPhotoService photoService, ITool tools)
        {
            _context = context;
            _mapper = mapper;
            _photoService = photoService;
            _tools = tools;
        }

        public async Task<bool> DeleteUserAsync(int id)
        {
            var deleteUser = _context.Users!.SingleOrDefault(u => u.Id == id);
            if (deleteUser != null)
            {
                _context.Users!.Remove(deleteUser);
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<string> EditAvatarAsync(int id, IFormFile file)
        {
            var user = await _context.Users!.FindAsync(id);

            if (user != null)
            {
                var addResult = await _photoService.AddPhotoAsync(file);
                if (addResult.Error != null) return string.Empty;

                if (user.AvatarId != null)
                {
                    var deleteResult = await _photoService.DeletePhotoAsync(user.AvatarId);
                    if (deleteResult.Error != null || deleteResult.Result == "not found") return string.Empty;
                }
                var Url = addResult.SecureUrl.AbsoluteUri;
                user.AvatarUrl = Url;
                user.AvatarId = addResult.PublicId;
                _context.Users!.Update(user);
                await _context.SaveChangesAsync();
                return Url;
            }
            return string.Empty;
        }

        public async Task<IEnumerable<UserModel>> GetAllUsersAsync()
        {
            var users = await _context.Users!.ToListAsync();
            return _mapper.Map<IEnumerable<UserModel>>(users);
        }

        public async Task<UserModel> GetUserByIdAsync(int id)
        {
            var user = await _context.Users!.FindAsync(id);
            return _mapper.Map<UserModel>(user);
        }
        public async Task<UserModel> UpdateProfileAsync(int id, ProfileParams entryParams)
        {
            var updateProfile = await _context.Users!.FindAsync(id);
            if (updateProfile != null)
            {
                _tools.Duplicate(entryParams, ref updateProfile);
                _context.Users!.Update(updateProfile);
                await _context.SaveChangesAsync();
                return _mapper.Map<UserModel>(updateProfile);
            }
            return null!;
        }

        public async Task<UserModel> UpdateUserAsync(int id, UserPrams entryParams, IFormFile? file)
        {
            var updateUser = await _context.Users!.FindAsync(id);
            if (updateUser != null)
            {
                if(file != null)
                {
                    var addResult = await _photoService.AddPhotoAsync(file);
                    if (addResult.Error != null) return null!;

                    if (updateUser.AvatarId != null)
                    {
                        var deleteResult = await _photoService.DeletePhotoAsync(updateUser.AvatarId);
                        if (deleteResult.Error != null || deleteResult.Result == "not found") return null!;
                    }
                    var Url = addResult.SecureUrl.AbsoluteUri;
                    updateUser.AvatarUrl = Url;
                    updateUser.AvatarId = addResult.PublicId;
                }
                _tools.Duplicate(entryParams, ref updateUser);
                _context.Users!.Update(updateUser);
                await _context.SaveChangesAsync();
                return _mapper.Map<UserModel>(updateUser);
            }
            return null!;
        }
    }
}

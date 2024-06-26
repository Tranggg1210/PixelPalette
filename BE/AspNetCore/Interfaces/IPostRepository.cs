﻿using CloudinaryDotNet.Actions;
using PixelPalette.Helpers;
using PixelPalette.Models;
using System.Runtime.CompilerServices;

namespace PixelPalette.Interfaces
{
    public interface IPostRepository
    {
        Task<PostModel> AddPostAsync(int userId, PostCreateParams entryParams, IFormFile file);
        Task<IEnumerable<PostModel>> GetAllPostAsync();
        Task<PostModel> GetPostByIdAsync(int id);
        Task<PostModel> UpdatePostAsync(int id, PostUpdateParams entryParams, int userId, IFormFile? file);
        Task<bool> DeletePostAsync(int id);
        Task<IEnumerable<PostModel>> GetPostByCollectionIdAsync(int userId, int? collectionId);
        Task<IEnumerable<PostModel>> GetPostByUserIdAsync(int userId);
        Task<bool> OwnershipAsync(int userId, int postId, int? collectionId);
        Task<bool> LikePostAsync(int postId, int userId);
        Task<bool> checkLikeAsync(int postId, int userId);
    }
}

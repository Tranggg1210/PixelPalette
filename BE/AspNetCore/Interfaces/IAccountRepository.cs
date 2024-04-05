﻿using Microsoft.AspNetCore.Identity;
using PixelPalette.Entities;
using PixelPalette.Models;

namespace PixelPalette.Interfaces
{
    public interface IAccountRepository
    {
        public Task<IdentityResult> SignUpAsync(SignUpModel model);
        public Task<string> SignInAsync(SignInModel model);
    }
}

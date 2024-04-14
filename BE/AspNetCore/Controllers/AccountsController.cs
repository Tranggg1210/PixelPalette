﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PixelPalette.Helpers;
using PixelPalette.Interfaces;
using PixelPalette.Models;
using System.Security.Claims;

namespace PixelPalette.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "v1")]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountRepository _accountRepo;

        public AccountsController(IAccountRepository repo)
        {
            _accountRepo = repo;
        }
        [HttpPost("SignUp")]
        public async Task<IActionResult> SignUp(SignUpModel signUpModel)
        {
            var result = await _accountRepo.SignUpAsync(signUpModel);
            if (result.Succeeded)
            {
                return Ok(result.Succeeded);
            }
            return StatusCode(500, "Error from Server!");
        }
        [HttpPost("SignIn")]
        public async Task<IActionResult> SignIn(SignInModel signInModel)
        {
            if (!await _accountRepo.SignInAsync(signInModel))
                return Unauthorized("Login unsuccessful!");
            return Ok(new { token = await _accountRepo.CreateToken() });
        }
        [HttpPut("ChangePassword")]
        [Authorize]
        public async Task<IActionResult> ChangePassword(ChangePasswordParams param)
        {
            if (!await _accountRepo.ChangePasswordAsync(param))
                ModelState.AddModelError("","Change new password failure!");
            return Ok("Change new password successful");
        }
    }
}

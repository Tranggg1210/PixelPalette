<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Post extends Model
{
    protected $table = 'Post';
    protected $primaryKey = 'Id';
    const SEARCHABLE_FIELDS = ['Caption', 'Detail'];

    use HasFactory, Searchable;

    public function toSearchableArray()
    {
        return $this->only(self::SEARCHABLE_FIELDS);
    }

    public function searchableAs()
    {
        return 'PixelPalette_post';
    }
    public function getLatestPost(User $user){
        return $this->where('user_id', $user->Id)->latest()->first();
    }
    public function getCountPost(){
        return $this-> all() -> count();
    }
}

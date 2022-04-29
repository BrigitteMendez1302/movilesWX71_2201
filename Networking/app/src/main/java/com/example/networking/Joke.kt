package com.example.networking

import com.google.gson.annotations.SerializedName

class Joke (
    @SerializedName("joke")
    var joke: String
)
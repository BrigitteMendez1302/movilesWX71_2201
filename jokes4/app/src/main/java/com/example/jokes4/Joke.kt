package com.example.jokes4

import com.google.gson.annotations.SerializedName

class Joke (
    @SerializedName("joke")
    var joke: String
    )
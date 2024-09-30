package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "yesterday I have seen the movie Godzilla x Kong the new empire/n",
			"theme":   "a wounderful movie with the VFX",
		})
	})
	r.Run(":8082")
}

package main

import (
  "net/http"

  "github.com/gin-gonic/gin"
)

func main() {
  r := gin.Default()
  r.POST("/api/v1/test", func(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{})
  })
  r.Run("127.0.0.1:3000") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}

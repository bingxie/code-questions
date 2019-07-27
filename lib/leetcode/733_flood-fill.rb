# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  current_color = image[sr][sc]

  return image if current_color == new_color

  image[sr][sc] = new_color

  flood_fill(image, sr - 1, sc, new_color) if sr > 0 && image[sr - 1][sc] == current_color
  flood_fill(image, sr, sc - 1, new_color) if sc > 0 && image[sr][sc - 1] == current_color
  flood_fill(image, sr + 1, sc, new_color) if sr + 1 < image.size && image[sr + 1][sc] == current_color
  flood_fill(image, sr, sc + 1, new_color) if sc + 1 < image[0].size && image[sr][sc + 1] == current_color

  image
end

image = [[1,1,1],[1,1,0],[1,0,1]]
sr = 1
sc = 1
new_color = 2

p flood_fill(image, sr, sc, new_color)

/**
 * @param {string} instructions
 * @return {boolean}
 */
const isRobotBounded = instructions => {
  let posX = 0;
  let posY = 0;

  let facing = 0; // North: 0 , East: 1, South: 2, West: 3
  const directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ];

  const processor = {
    G: () => {
      posX += directions[facing][0];
      posY += directions[facing][1];
    },

    L: () => {
      if (facing === 0) {
        facing = 3;
      } else {
        facing--;
      }
    },

    R: () => {
      if (facing === 3) {
        facing = 0;
      } else {
        facing++;
      }
    }
  };

  for (let i = 0; i < instructions.length; i++) {
    processor[instructions[i]]();
  }
  // 执行一遍后，要门回到原点，要么不朝向北，只要循环就会回到原点
  return (posX === 0 && posY === 0) || facing > 0;
};

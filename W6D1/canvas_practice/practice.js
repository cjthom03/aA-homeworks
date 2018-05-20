document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'blue';
  ctx.fillRect(10, 20, 150, 85);

  ctx.beginPath();
  ctx.arc(160, 95, 50, 0, 2*Math.PI);
  ctx.strokeStyle = 'orange';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'orange';
  ctx.fill();

  ctx.beginPath();
  ctx.arc(160, 145, 50, .5*Math.PI, 1.5*Math.PI);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'green';
  ctx.fill();

  ctx.beginPath();
  ctx.arc(160, 120, 50, 1.5*Math.PI, .5*Math.PI);
  ctx.strokeStyle = 'purple';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'purple';
  ctx.fill();

});

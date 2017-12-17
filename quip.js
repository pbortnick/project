var startBrush = new Date().getTime() / 1000;
var endBrush = new Date().getTime() / 1000;
var totalBrush = endBrush - startBrush;
var brushGoalsGained
function brushGoal() {
  if (totalBrush > 120) {
    return brushGoalsGained++
  } else {
    return brushGoalsGained
  }
}

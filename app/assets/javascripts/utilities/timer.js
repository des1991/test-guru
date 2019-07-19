document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('#test_passage-timer')

  if (timer) {
    startTimer(timer)
  }
})

function startTimer(timer) {
  var timer_remained = timer.querySelector('#test_passage-timer-remained')
  var timer_form = document.querySelector('#test_passage-form')
  var time_left = timer.dataset.timerLeft
  var time_total = timer.dataset.timerTotal

  setTimeout(function updateTimer() {
    time_left -= 1
    var measuredTime = new Date(null)
    measuredTime.setSeconds(time_left)

    timer_remained.innerText = measuredTime.toISOString().substr(11, 8)

    time_left > 0 ? setTimeout(updateTimer, 1000) : timer_form.submit()
  }, 1000)
}

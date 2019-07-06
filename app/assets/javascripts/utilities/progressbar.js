document.addEventListener('turbolinks:load', function() {
  var progressbar = document.querySelector('.progress-bar')

  if (progressbar) {
    var current = progressbar.getAttribute('aria-valuenow')
    var max = progressbar.getAttribute('aria-valuemax')
    var percent = (current * 100 / max) + '%'

    progressbar.style.width = percent
    progressbar.textContent = percent
  }
})

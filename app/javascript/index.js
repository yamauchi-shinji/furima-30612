window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
  pullDownChild.forEach(function(list) {
    list.addEventListener('click', function() {
      const renderDom = document.getElementById("search-form")
      value = list.value
      const categoryObj = `<input value=${value} name='category_id' type="hidden">`
      renderDom.insertAdjacentHTML("beforeend", categoryObj)
      document.getElementById("search-form").submit()
    })
  })
})
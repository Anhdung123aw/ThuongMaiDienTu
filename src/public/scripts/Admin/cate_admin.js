document.addEventListener("DOMContentLoaded", function () {
  const checkboxAll = document.querySelector("thead .checkbox");
  const checkboxes = document.querySelectorAll("tbody .checkbox");

  if (!checkboxAll) return;

  checkboxAll.addEventListener("click", checkAll);

  checkboxes.forEach((cb) => cb.addEventListener("click", checkOne));

  function checkAll() {
    checkboxes.forEach((cb) => (cb.checked = checkboxAll.checked));
  }

  function checkOne() {
    checkboxAll.checked = Array.from(checkboxes).every((cb) => cb.checked);
  }
});

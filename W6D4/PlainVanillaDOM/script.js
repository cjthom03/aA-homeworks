document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  const addFav  = (e) => {
    e.preventDefault();
    const input = document.getElementsByClassName("favorite-input")[0];
    const value = input.value;
    input.value = "";

    const li = document.createElement("li");
    li.textContent = value;
    document.getElementById("sf-places").append(li);
  };


  const showForm = (e) => {
    const form = document.getElementsByClassName("photo-form-container")[0];
    form.classList.toggle("hidden");
  };

  const addPhoto = (e) => {
    e.preventDefault();
    const input = document.getElementsByClassName("photo-url-input")[0];
    const value = input.value;
    input.value = "";

    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = value;

    li.append(img);
    document.getElementsByClassName("dog-photos")[0].append(li);

  };




  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  document.getElementById("favorite-places").addEventListener("submit", addFav);

  document.getElementsByClassName("photo-show-button")[0].addEventListener("click", showForm);

  document.getElementsByClassName("photo-form-container")[0].addEventListener("submit", addPhoto);






});

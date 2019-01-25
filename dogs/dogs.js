'use strict';

function getDogImage(numDogs) {
  const dogPics = [];
  for (let i = 0; i < numDogs; i++) {
    fetch('https://dog.ceo/api/breeds/image/random')
      .then(response => response.json())
      .then(responseJson => 
        dogPics.push(responseJson))
      .catch(error => alert('Something went wrong. Try again later.'));
  }
  displayResults(dogPics);
}

function displayResults(responseJson) {
  console.log(responseJson);
  //replace the existing image with the new one
  $('.results-img').html(
    responseJson
  );
  //display the results section
  $('.results-img').removeClass('hidden');
}

function watchForm() {
  $('form').submit(event => {
    event.preventDefault();
    const numRadomDogs = $('.js-number').val();
    getDogImage(numRadomDogs);
  });
}

$(function() {
  console.log('App loaded! Waiting for submit!');
  watchForm();
});
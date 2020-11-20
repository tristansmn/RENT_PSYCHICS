import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');
  const hours = document.querySelector("#hours")
  const pricePerHour = document.querySelector("#price_per_hour").innerText
  const price = document.querySelector("#price") 

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {

  flatpickr(startDateInput, {
    minDate: "today",
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });

  startDateInput.addEventListener("change", (e) => {
    flatpickr(endDateInput, {
      minDate: e.target.value,
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      });
    })
};

[startDateInput, endDateInput].forEach(date => {
  date.addEventListener("change", (event) => {
  let dateDiff = new Date(endDateInput.value) - new Date(startDateInput.value);
  let totalHours = Math.ceil(dateDiff / (86400000 / 24));
  if (startDateInput.value && endDateInput.value) {
    hours.innerText = totalHours
    price.innerText = totalHours * pricePerHour
  }
});
})

$('.accessory-display').css('display', 'none');

const $checkboxes = $('.form-check input[type="checkbox"]')
$checkboxes.change(function(){
        let countCheckedCheckboxes = $checkboxes.filter(':checked').length;
        $('.number_accessory').text(countCheckedCheckboxes);
        $('.price_accessory').text(countCheckedCheckboxes * 10);
        if (countCheckedCheckboxes >= 1) {
        $('.accessory-display').css('display', 'block');
        $('.accessory').text(" accessories:");
        } else {
        $('.accessory').text(" accessory:");
        };
        console.log(countCheckedCheckboxes)
    });


}
export { initFlatpickr };


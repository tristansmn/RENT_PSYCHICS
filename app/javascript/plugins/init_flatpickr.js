import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {

  flatpickr(startDateInput, {
    minDate: "today",
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      });
    })
};
}

export { initFlatpickr };
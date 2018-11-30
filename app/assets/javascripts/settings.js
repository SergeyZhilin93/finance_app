$(document).on('turbolinks:load', function() {
  const editButtons = document.querySelectorAll('.js-edit-record');

  const addPaymentButton = $('.js-add-payment')[0]
  const addIncomeButton = $('.js-add-income')[0]

  function togglePaymentsForm(e) {
    const formContainer = $(e.target).parents('.payments').find('.payments-form')
    formContainer.toggleClass('hidden')
  }

  function toggleIncomesForm(e) {
    const formContainer = $(e.target).parents('.incomes').find('.incomes-form')
    formContainer.toggleClass('hidden')
  }

  function toggleEditForm(e) {
    const container = $(e.target).parents('.record')
    const form = container.find('.edit-record-form')
    form.toggleClass('hidden')
  }

  addPaymentButton.addEventListener('click', togglePaymentsForm, false)
  addIncomeButton.addEventListener('click', toggleIncomesForm, false)
  editButtons.forEach(button => button.addEventListener('click', toggleEditForm, false))
})

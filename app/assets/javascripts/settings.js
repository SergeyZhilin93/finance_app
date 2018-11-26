$(document).ready(function() {

  const addPaymentButton = $('.js-add-payment')[0]
  const addIncomeButton = $('.js-add-income')[0]
  const editPaymentButton = document.querySelectorAll('.js-edit-payment');
  const editIncomeButton = document.querySelectorAll('.js-edit-income');

  function togglePaymentsForm(e) {
    const formContainer = $(e.target).parents('.payments').find('.payments-form')
    formContainer.toggleClass('hidden')
  }

  function toggleIncomesForm(e) {
    const formContainer = $(e.target).parents('.incomes').find('.incomes-form')
    formContainer.toggleClass('hidden')
  }

  function toggleEditPaymentForm(e) {
    const container = $(e.target).parents('.record')
    const payment_id = container.attr('data-id')
    const form = $('.edit-payment').submit(e => e.preventDefault())
    form.toggleClass('hidden')
    const categoryName = container.find('.record__name').attr('data-name')
    form.find('.payment-name').val(categoryName)
    const btn = $('.payment-btn')
    btn.click(function(){
      handlesubmitForm(payment_id, '.payment-name')
    })
  }

  function toggleEditIncomeForm(e) {
    const container = $(e.target).parents('.record')
    const income_id = container.attr('data-id')
    const form = $('.edit-income').submit(e => e.preventDefault())
    form.toggleClass('hidden')
    const categoryName = container.find('.record__name').attr('data-name')
    form.find('.income-name').val(categoryName)
    const btn = $('.income-btn')
    btn.click(function(){
      handlesubmitForm(income_id, '.income-name')
    })
  }

  function handlesubmitForm(id, valueSelector) {
    const name = $(valueSelector).val()
    const data = {
      category: {
        name
      }
  }
    axios.put(`http://localhost:3000/category/${id}`, data)
    .then(() =>  window.location.href = 'http://localhost:3000')
  }

  addPaymentButton.addEventListener('click', togglePaymentsForm, false)
  addIncomeButton.addEventListener('click', toggleIncomesForm, false)
  editPaymentButton.forEach(button => button.addEventListener('click', toggleEditPaymentForm, false))
  editIncomeButton.forEach(button => button.addEventListener('click', toggleEditIncomeForm, false))
})

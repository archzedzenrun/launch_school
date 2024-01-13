// PP 1
// You can't identify how the object was created, and since a factory function works based on a template, you might end up with unwanted properties on objects or redundant methods across multiple objects.

// PP 2
function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}

// PP 3
function createInvoice(services = {}) {
  let paymentsMade = [];

  function paymentsTotal() {
    let totals = paymentsMade.map(payment => payment.total());
    return totals.reduce((total, value) => total + value, 0);
  }

  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    total() {
      return this.phone + this.internet;
    },
    addPayment(payments) {
      paymentsMade.push(createPayment(payments));
    },
    addPayments(payments) {
      payments.forEach(payment => paymentsMade.push(createPayment(payment)));
    },
    amountDue() {
      return this.total() - paymentsTotal();
    }
  };
}

function invoiceTotal(invoices) {
  let total = 0;
  let i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

let invoices = [];
invoices.push(createInvoice());
invoices.push(createInvoice({
  internet: 6500,
}));

invoices.push(createInvoice({
  phone: 2000,
}));

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
}));

console.log(invoiceTotal(invoices));             // => 31000

// PP 4
function createPayment(services = {}) {
  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount,
    total() {
      return this.amount || (this.phone + this.internet);
    }
    // paid: services,
    // total() {
    //   if (services.amount) {
    //     return services.amount;
    //   } else {
    //     return Object.values(this.paid).reduce((total, service) => {
    //       return total + service;
    //     }, 0)
    //   }
    // }
  };
}

function paymentTotal(payments) {
  let total = 0;
  let i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0
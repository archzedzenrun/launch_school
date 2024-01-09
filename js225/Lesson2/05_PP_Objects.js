let invoices = {
  unpaid: [],
};

invoices.add = function(name, amount) {
  this.unpaid.push({ name, amount });
};

invoices.totalDue = function() {
  return this.unpaid.reduce((total, invoice) => total + invoice.amount, 0);
}

invoices.paid = [];

invoices.payInvoice = function(name) {
  let unpaid = [];
  this.unpaid.forEach(invoice => {
    if (invoice.name === name) {
      this.paid.push(invoice);
    } else {
      unpaid.push(invoice);
    }
  })

  this.unpaid = unpaid;
}

invoices.totalPaid = function() {
  return this.paid.reduce((total, invoice) => total + invoice.amount, 0);
}

// invoices.add('Hardware store', 5612);
invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);
invoices.payInvoice('Slough Digital');
invoices.payInvoice('Due North Development');
console.log(invoices.totalPaid());
console.log(invoices.totalDue());
// console.log(invoices);
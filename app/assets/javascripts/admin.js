  $(document).ready(function () {
    $('#sheet').show();
      $('#sheet').handsontable({
      data: [],
      dataSchema: {RFR: null, B: null, ERM: null},
      colWidths: [100, 100],
      rowHeaders: true,
      colHeaders: ['Handle', 'Tags'],
      columns: [{data: "Handle"}, {data: "Tags"}],
      minSpareRows: 1,
      // maxRows:20,
    });
  });
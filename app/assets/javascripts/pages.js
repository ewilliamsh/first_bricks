function llamaAjax(){
    console.log("ready");
//llamaajax
            var waTable = $('#lst_fac').WATable({
            debug:false,
            dataBind: true,
            pageSize: 20,
            pageSizePadding: true,
            filter: true,
            sorting: true,
            sortEmptyLast:true,
            columnPicker: true,
            pageSizes: [1,5,8,12,200, "all"],
            hidePagerOnEmpty: true,
            checkboxes: true,
            checkAllToggle:true,
            preFill: true,
            types: {
                string: {
                    filterTooltip: "Escriba algún criterio de búsqueda."
                },
                number: {
                    decimals: 2
                },
                bool: {
                },
                date: {
                  utc: true,
                  format: 'yyyy/MM/dd',
                  datePicker: true
                }
            },
           /*actions: {                //This generates a button where you can add elements.
                filter: true,         //If true, the filter fields can be toggled visible and hidden.
                columnPicker: true,   //if true, the columnPicker can be toggled visible and hidden.
                custom: [             //Add any other elements here. Here is a refresh and export example.
                  $('<a href="#" class="refresh"><span class="glyphicon glyphicon-refresh"></span>&nbsp;Refrescar</a>'),
                  $('<a href="#" class="export all"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar todas las filas</a>'),
                  $('<a href="#" class="export checked"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas chequeadas</a>'),
                  $('<a href="#" class="export filtered"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas filtradas</a>'),
                  $('<a href="#" class="export rendered"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas rendereadas</a>')
                ]
            }, */
            tableCreated: function(data) {
                console.log('table created');
                console.log(data);
            },
            rowClicked: function(data) {
                console.log('row clicked');
                console.log(data);
                if (data.column) {
                    data.event.preventDefault();
                    //alert('You clicked column:' + data.column.column + ' with value:' + data.row[data.column.column]);
                }
            },
            columnClicked: function(data) {
              console.log('column clicked');
              console.log(data);
            },
            pageChanged: function(data) {
              console.log('page changed');
              console.log(data);
            },
            pageSizeChanged: function(data) {
              console.log('pagesize changed');
              console.log(data);
            }
        }).data('WATable');

        console.log("$> Consumir Servicio");
        /*var datox = {};
        $.ajax({
                type:"GET",
                dataType : 'json',
                url: "/api/products/FF975ED698374C768F39217FA6ED4DFB",
                success: function(datox){
                waTable.setData(jsonConstructor(datox)); 
                document.getElementById("loader-wrapper").style.display = "none";
                document.body.style.overflowY = "scroll"; 
            },
                error:  function(){ 
                var mensajeError = '<br><br><br><div align="center"><h1>Ups!! algo ha salido mal.</h1><h3>No ha sido posible entablar comunicación, por favor comuniquese con su proveedor.</h3></div>'
                document.getElementById("lst_fac").innerHTML = mensajeError;
                }
        });*/
 }

/*$(document).ready( function(){
    console.log("ready");
//llamaajax
            var waTable = $('#lst_fac').WATable({
            debug:false,
            dataBind: true,
            pageSize: 20,
            pageSizePadding: true,
            filter: true,
            sorting: true,
            sortEmptyLast:true,
            columnPicker: true,
            pageSizes: [1,5,8,12,200, "all"],
            hidePagerOnEmpty: true,
            checkboxes: true,
            checkAllToggle:true,
            preFill: true,
            types: {
                string: {
                    filterTooltip: "Escriba algún criterio de búsqueda."
                },
                number: {
                    decimals: 2
                },
                bool: {
                },
                date: {
                  utc: true,
                  format: 'yyyy/MM/dd',
                  datePicker: true
                }
            },
           / *actions: {                //This generates a button where you can add elements.
                filter: true,         //If true, the filter fields can be toggled visible and hidden.
                columnPicker: true,   //if true, the columnPicker can be toggled visible and hidden.
                custom: [             //Add any other elements here. Here is a refresh and export example.
                  $('<a href="#" class="refresh"><span class="glyphicon glyphicon-refresh"></span>&nbsp;Refrescar</a>'),
                  $('<a href="#" class="export all"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar todas las filas</a>'),
                  $('<a href="#" class="export checked"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas chequeadas</a>'),
                  $('<a href="#" class="export filtered"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas filtradas</a>'),
                  $('<a href="#" class="export rendered"><span class="glyphicon glyphicon-share"></span>&nbsp;Exportar filas rendereadas</a>')
                ]
            }, * /
            tableCreated: function(data) {
                console.log('table created');
                console.log(data);
            },
            rowClicked: function(data) {
                console.log('row clicked');
                console.log(data);
                if (data.column) {
                    data.event.preventDefault();
                    //alert('You clicked column:' + data.column.column + ' with value:' + data.row[data.column.column]);
                }
            },
            columnClicked: function(data) {
              console.log('column clicked');
              console.log(data);
            },
            pageChanged: function(data) {
              console.log('page changed');
              console.log(data);
            },
            pageSizeChanged: function(data) {
              console.log('pagesize changed');
              console.log(data);
            }
        }).data('WATable');

        console.log("$> Consumir Servicio");
        / *var datox = {};
        $.ajax({
                type:"GET",
                dataType : 'json',
                url: "/api/products/FF975ED698374C768F39217FA6ED4DFB",
                success: function(datox){
                waTable.setData(jsonConstructor(datox)); 
                document.getElementById("loader-wrapper").style.display = "none";
                document.body.style.overflowY = "scroll"; 
            },
                error:  function(){ 
                var mensajeError = '<br><br><br><div align="center"><h1>Ups!! algo ha salido mal.</h1><h3>No ha sido posible entablar comunicación, por favor comuniquese con su proveedor.</h3></div>'
                document.getElementById("lst_fac").innerHTML = mensajeError;
                }
        });* /
 }
);*/

function jsonConstructor(json) {
    var rows = [];
    var jsonObject = json.response;
    /*for (var i=0;i<jsonObject.totalRows;i++) {
        var strDate = JSON.stringify(jsonObject.data[i].dateinvoiced);
        var strPagado = JSON.stringify(jsonObject.data[i].pagado);
        var pagado = "";
        jsDate = new Date(strDate);
        var dia = jsDate.getDate();
        var mes = jsDate.getMonth();
        var ano = jsDate.getFullYear()
        var row = {};
        // validar pago
        if (strPagado == "true") {
            row.Pagado = true;
        } else {
            row.Pagado = false;
        }
        row.Factura_ID = jsonObject.data[i].id;
        row.Docstatus = jsonObject.data[i].docstatus;
        row.Factura =   jsonObject.data[i].documentno;
        //row.Subtotal =  jsonObject.data[i].totallines;
        row.Subtotal = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].totallines)).toFixed(2));
        //row.Impuesto =  jsonObject.data[i].impuesto;
        row.Impuesto = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].impuesto)).toFixed(2));
        //row.Total =     jsonObject.data[i].grandtotal;
        row.Total = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].grandtotal)).toFixed(2));
        row.Fecha = Date.UTC(ano, mes, dia);
        //row.Pagado = pagado;
        //row.Pendiente = jsonObject.data[i].pendiente;
        row.Pendiente = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].pendiente)).toFixed(2));
        row["row-checkable"] = true;
        row["row-checked"]   = false;
        row["row-cls"]       = "";

        rows.push(row);
    } 
    */
    for (var i=0;i<jsonObject.totalRows;i++) {
        var strDate = JSON.stringify(jsonObject.data[i].dateinvoiced);
        var strPagado = JSON.stringify(jsonObject.data[i].pagado);
        var pagado = "";
        jsDate = new Date(strDate);
        var dia = jsDate.getDate();
        var mes = jsDate.getMonth();
        var ano = jsDate.getFullYear()
        var row = {};
        // validar pago
        if (strPagado == "true") {
            row.Pagado = true;
        } else {
            row.Pagado = false;
        }
        row.Factura_ID = jsonObject.data[i].id;
        row.Docstatus = jsonObject.data[i].docstatus;
        row.Factura =   jsonObject.data[i].documentno;
        //row.Subtotal =  jsonObject.data[i].totallines;
        row.Subtotal = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].totallines)).toFixed(2));
        //row.Impuesto =  jsonObject.data[i].impuesto;
        row.Impuesto = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].impuesto)).toFixed(2));
        //row.Total =     jsonObject.data[i].grandtotal;
        row.Total = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].grandtotal)).toFixed(2));
        row.Fecha = Date.UTC(ano, mes, dia);
        //row.Pagado = pagado;
        //row.Pendiente = jsonObject.data[i].pendiente;
        row.Pendiente = separaMiles(parseFloat(JSON.stringify(jsonObject.data[i].pendiente)).toFixed(2));
        row["row-checkable"] = true;
        row["row-checked"]   = false;
        row["row-cls"]       = "";

        rows.push(row);
    }
    // Definir columnas
    var cols = {
        Factura: {
            index: 1,
            type: "string",
            friendly: "# Factura",
            unique: true,
            sortOrder: "asc",
            filter: false
        },
        Subtotal: {
            index: 2,
            type: "string",
            friendly: "",
            cls: "montos", //apply some css classes
            placeHolder: "",
            format: "$ {0}" 
        },
        Impuesto: {
            index: 3,
            type: "string",
            friendly: "",
            cls: "montos", //apply some css classes
            placeHolder: "",
            format: "$ {0}"
        },
        Total: {
            index: 4,
            type: "string",
            friendly: "",
            cls: "montos", //apply some css classes
            placeHolder: "",
            format: "$ {0}"
        },
         Fecha: {
            index: 5,
            type: "date", //Don't forget dates are expressed in milliseconds
            dateFormat: "yyyy-MM-dd", //Special date format
            friendly: "Fecha",
            placeHolder: "Las facturas màs antiguas se ven primero."
        },
        Docstatus: {
            index: 6,
            type: "string",
            friendly: "Estado",
            placeHolder: ""
        },
        Pagado: {
            index: 7,
            type: "bool",
            friendly: "Pagado",
            placeHolder: ""
        },
        Pendiente: {
            index: 8,
            type: "string",
            friendly: "",
            cls: "montos", //apply some css classes
            placeHolder: "",
            format: "$ {0}"
        },
        Factura_ID: {
            index: 8,
            type: "string",
            friendly: "ID",
            hidden: true
        }
    };
    // Contruir el json de datos
    var data = {
                cols: cols,
                rows: rows,
                otherStuff: {
                    thatIMight: 1,
                    needLater: true
                }
            };
    return data;
}
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
        var datox = {};
        $.ajax({
                type:"GET",
                dataType : 'json',
                url: "/api/products/",
                success: function(datox){
                //console.log(datox);
                waTable.setData(jsonConstructor(datox)); 
                //document.getElementById("loader-wrapper").style.display = "none";
                document.body.style.overflowY = "scroll"; 
            },
                error:  function(){ 
                var mensajeError = '<br><br><br><div align="center"><h1>Ups!! algo ha salido mal.</h1><h3>No ha sido posible entablar comunicación, por favor comuniquese con su proveedor.</h3></div>'
                document.getElementById("lst_fac").innerHTML = mensajeError;
                }
        });
 }

$(document).ready( function(){
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
        var datox = {};
        $.ajax({
                type:"GET",
                dataType : 'json',
                url: "/api/products/",
                success: function(datox){
                //console.log(datox);
                waTable.setData(jsonConstructor(datox)); 
                //document.getElementById("loader-wrapper").style.display = "none";
                document.body.style.overflowY = "scroll"; 
            },
                error:  function(){ 
                var mensajeError = '<br><br><br><div align="center"><h1>Ups!! algo ha salido mal.</h1><h3>No ha sido posible entablar comunicación, por favor comuniquese con su proveedor.</h3></div>'
                document.getElementById("lst_fac").innerHTML = mensajeError;
                }
        });
 
});

function jsonConstructor(json) {
    var rows = [];
    console.log("$> jsonConstructor");
    console.log(json);
    console.log("$> json[] parse");
    //console.log(JSON.stringity(json));
    //console.log(JSON.parse(json));
    
    var jsonObject = json.products;
    console.log(jsonObject);
    
    //for (var i=0;i<jsonObject.totalRows;i++) {
        $.each(jsonObject,function(index, product){
        var strDate = JSON.stringify(product.creationDate);
        console.log(product.creationDate);

        jsDate = new Date(product.creationDate);
        console.log(strDate);
        console.log(jsDate);
        var dia = jsDate.getDate();
        var mes = jsDate.getMonth();
        var ano = jsDate.getFullYear()
        var row = {};
        row.Producto_ID = product.id;
        row.Name = product.name;
        row.Value = product.searchKey;
        row.Sku = product.sku;
        row.Fecha = Date.UTC(ano, mes, dia);
        console.log(Date.UTC(ano, mes, dia));

        row["row-checkable"] = true;
        row["row-checked"]   = false;
        row["row-cls"]       = "";

        rows.push(row);
    })
    // Definir columnas
    var cols = {
        Name: {
            index: 1,
            type: "string",
            friendly: "# Nombre",
            unique: true,
            sortOrder: "asc",
            filter: false
        },
        Value: {
            index: 2,
            type: "string",
            friendly: "# Identificador",
            cls: "montos", //apply some css classes
            placeHolder: "",
            format: "$ {0}" 
        },
        Sku: {
            index: 3,
            type: "string",
            friendly: "",
            unique: true,
            filter: false
        },
        Fecha: {
            index: 4,
            type: "date",
            dateFormat: "yyyy-MM-dd" 
        },
        Producto_ID: {
            index: 5,
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
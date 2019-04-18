@extends('layouts.master')
@section('style')
<link href="{{url('/css/bootstrap-datepicker.css')}}" rel="stylesheet">
<style>
#billItem thead th {
  color:#3986AC;
}
</style>
@stop
@section('content')
@if (Session::get('success'))
<div class="alert alert-success">
  <button data-dismiss="alert" class="close" type="button">×</button>
  <strong>Process Success.</strong> {{ Session::get('success')}}<br>

</div>
@endif
@if (count($errors) > 0)
<div class="alert alert-danger">
  <strong>Whoops!</strong> There were some problems.<br><br>
  <ul>
    @foreach ($errors->all() as $error)
    <li>{{ $error }}</li>
    @endforeach
  </ul>
</div>
@endif
<div class="row">
  <div class="box col-md-12">
    <div class="box-inner">
      <div data-original-title="" class="box-header well">
        <h2><i class="glyphicon glyphicon-list"></i>Invoices</h2>

      </div>
      <div class="box-content">

        <form role="form" action="{{url('/fees/invoices')}}" method="post" enctype="multipart/form-data">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="row">
            <div class="col-md-12">



              <div class="col-md-4">
                <div class="form-group">
                  <label class="control-label" for="class">Class</label>

                  <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home blue"></i></span>
                    {{ Form::select('class',$classes,$student->class,['class'=>'form-control','id'=>'class','required'=>'true'])}}

                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group">
                  <label class="control-label" for="section">Section</label>

                  <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign blue"></i></span>
                    <?php  $data=$section;

                          //echo "<pre>";print_r($data);
                    ?>
                    {{ Form::select('section',$data,$student->section,['class'=>'form-control','id'=>'section','required'=>'true'])}}
                  </div>
                </div>
              </div>

             <?php /* <div class="col-md-4">
                <div class="form-group">
                  <label class="control-label" for="shift">Shift</label>

                  <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign blue"></i></span>
                    <?php  $data=[
                      'Day'=>'Day',
                      'Morning'=>'Morning'
                    ];?>
                    {{ Form::select('shift',$data,$student->shift,['class'=>'form-control','id'=>'shift','required'=>'true'])}}


                  </div>
                </div>
              </div> */ ?>
            <input type="hidden" value="Morning" name="shift">

              {{--<div class="col-md-4">
                <div class="form-group ">
                  <label for="session">session</label>
                  <div class="input-group">

                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i> </span>
                    <input  value="{{date('Y')}}" type="text" id="session" required="true" class="form-control datepicker2" name="session"   data-date-format="yyyy" value="{{$student->session}}">
                  </div>
                </div>
              </div>--}}
            <input  value="{{get_current_session()->id}}" type="hidden" id="session" required="true" class="form-control datepicker2" name="session"   data-date-format="yyyy" >

            <div class="col-md-2">
                <div class="form-group">
                  <label class="control-label" for="">&nbsp;</label>

                  <div class="input-group">
                    <button class="btn btn-primary pull-right" id="btnsave" type="submit"><i class="glyphicon glyphicon-th"></i> Get List</button>

                  </div>
                </div>
              </div>
            </div>
          </div>

       <div class="row">
            <div class="col-md-12">
             
               {{--<div class="col-md-4">
                <div class="form-group">
                  <label class="control-label" for="student">Student</label>

                  <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-book blue"></i></span>
                    <select id="student" name="student" class="form-control" required="true">
                      <option value="">--Select Student--</option>
                    </select>
                  </div>
                </div>
              </div>--}}
              



            </div>
          </div>
          <hr class="hrclass">




        </form>
        @if($student->regiNo !="" && count($fees)<1)
        <div class="alert alert-danger">
          <strong>Whoops!</strong> There are no fees entry for this student.<br><br>
        </div>
        @endif
        @if($fees)
        <div class="row">
          <div class="col-md-12">
          <div id="oldtable">
            <table id="feeList" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <th>Bill No</th>
                  <th>Student</th>
                  <th>Fee Type</th>
                  <th>Payable Amount</th>
                  <th>Paid Amount</th>
                  <th>Due Amount</th>
                  <th>Month</th>
                  <th>Pay Date</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody id="ajax_data">
                @foreach($fees as $fee)
                  <tr>
                    <td><a class="btnbill" href="#" onclick="invoicepaidhistory('{{$fee->billNo}}');">{{$fee->billNo}}</a></td>
                    <td>{{$fee->firstName}} {{$fee->lastName}}</td>
                    <td>{{$fee->title}}</td>
                    <td>{{$fee->payableAmount}}</td>
                    <td>{{$fee->paidAmount}}</td>
                    <td>{{$fee->dueAmount}}</td>
                    <td> @if($fee->title=="monthly"){{ \DateTime::createFromFormat('!m', $fee->month)->format('F')}} @endif </td>
                    <td>{{$fee->date}}</td>
                    <?php
                      if($fee->payableAmount===$fee->paidAmount || $fee->paidAmount>=$fee->payableAmount){
                          $status = 'paid';
                      }elseif($fee->paidAmount=='0.00' ||$fee->paidAmount==''){

                            $status = 'unpaid';
                      }else{
                          $status = 'partially paid';
                      }
                      ?>
                    <td>@if($status=='paid')<button  class="btn btn-success" >{{$status}}</button>@elseif($status=='partially paid')<button  class="btn btn-warning" >{{$status}}</button>@else <button  class="btn btn-danger" >{{$status}}</button>@endif </td>
                    <td>
                      {{--<a title='Delete' class='btn btn-danger' href='{{url("/fees/delete")}}/{{$fee->billNo}}'> <i class="glyphicon glyphicon-trash icon-red"></i></a>--}}
                      <button value="{{$fee->billNo}}" title='Collect Invoice' class='btn btn-primary @if( $fee->paidAmount<$fee->payableAmount) btninvoice @endif' @if($fee->payableAmount===$fee->paidAmount || $fee->paidAmount>=$fee->payableAmount ) onclick = "alert('Invoice Fully Paid')" @endif> <i class="fas fa-dollar-sign icon-white"></i></button>
                      <a title='Edit' class='btn btn-warning' href='{{url("/fees/invoice/update")}}/{{$fee->billNo}}'> <i class="glyphicon glyphicon-pencil icon-white"></i></a>
                    </td>
                  </tr>
                @endforeach
              </tbody>
            </table>
            </div>
            </div>
            <div id="newtable">
            </div>
        </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table">

                <?php 
                 /* <tbody>
                  <tr>
                    <td></td>
                    <td>Total Payable: <strong><i class="blue">{{$totals->payTotal}}</i></strong> tk.</td>
                    <td>Total Paid: <strong><i class="blue">{{$totals->paiTotal}}</i></strong> tk.</td>
                    <td>Total Due: <strong><i class="blue">{{$fee->dueAmount}}</i></strong> tk.</td>
                    <td></td>

                    <td>
                      <a title='Print' id="btnPrint" class='btn btn-info' target='_blank' href='{{url("/fees/report/std")}}/{{$student->regiNo}}'> <i class="glyphicon glyphicon-print icon-red"></i> Print</a>
                    </td>
                  </tr>
                  </tbody> */ 
                ?>
              </table>
            </div>
          </div>
            @endif
          </div>
        </div>
      </div>

      
          @stop
          <!-- Modal Goes here -->
@section('model')
       <div id="billDetails" class="modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            {{--<div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Confirmation</h4>
            </div>--}}

            <div class="modal-header">
              <h4 class="modal-title">Confirmation</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-md-12">
                  <div class="table-responsive">
                    <table id="billItem" class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Amount</th>
                          <th>Date</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tbody>
                        </table>
                      </div>
                    </div>

                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
              </div>
            </div>
          </div>





       {{--<div class="modal" id="billDetailssss">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
         <div class="modal-body">
              <div class="row">
                <div class="col-md-12">
                  <div class="table-responsive">
                    <table id="billItems" class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>Amount</th>
                          <th>Date</th>
                          <th>Fee</th>
                          <th>Late Fee</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tbody>
                        </table>
                      </div>
                    </div>

                  </div>
                </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>--}}
  <div id="moddel">
    

  </div>
  @stop
          @section('script')
          <script src="{{url('/js/bootstrap-datepicker.js')}}"></script>
          <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
          <script type="text/javascript">
          var stdRegiNo="{{$student->regiNo}}";
           $('.datepicker').datepicker({
    format: 'mm/dd/yyyy',
    startDate: '-3d'
});

           function feecollection()
           {
            //alert(billNo);
              var billNo = $('#billNo').val();
               var collectionAmount = $('#collectionAmount').val();
               var payableAmount = $('#payableAmount').val();
              // var postid = $('#post_id').val();
              //"{{url('/fees/invoice/details/')}}"+'/'+billId,
                $.ajax({
                   type: "POST",
                   url: "{{url('/fees/invoice/collect/')}}"+'/'+billNo,
                   data: {collectionAmount:collectionAmount,payableAmount:payableAmount},
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},

                   success: function( msg ) {
                     //$("myModaldB003").modal().hide();
                  //alert(msg);
                     if(msg=='419'){
                      $("#oldtable").show();
                      $("#moddel .close").click();
                      Swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Collection Amount greater then Payable amount',
                        footer: ''
                      })
                     }else if(msg=='404'){
                      $("#oldtable").show();
                      $("#moddel .close").click();
                      Swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Collection Amount Not empty or 0',
                        footer: ''
                      })
                     }

                     else{
                     $("#oldtable").hide();
                     //$("#moddel").modal().hide();
                       $("#moddel .close").click();
                        //$("#ajax_data").remove();
                      //alert( JSON.stringify(msg) );
                      //console.log(msg);
                      //.// alert( "#myModald"+billNo+".close" );
                     //  obj.find('tbody').empty().append(msg);
                       
                      $("#newtable").html(msg);
                      $('#feeList1').dataTable({
                         "sPaginationType": "bootstrap",
                      });

                      $(".btninvoice").click(function(){
                          var billId=$(this).val();
                         // $('.modal-title').html('"'+billId+'" bill details information');
                          
                          $.ajax({
                            url: "{{url('/fees/invoice/details/')}}"+'/'+billId,
                            data: {
                              //format: 'json'
                            },
                            error: function(error) {
                              alert(JSON.stringify(error));
                            },
                            //dataType: 'json',
                            success: function(data) {
                              console.log(data);
                             // $("#moddel").find("tr:gt(0)").remove();
                              $("#moddel").html(data);
                              $("#myModald"+billId).modal('show');
                              

                            },
                            type: 'GET',

                            
                          });
                          //alert(("#myModald"+billId));
                          console.log("#myModald"+billId);
                          
                        });


                       Swal.fire(
                                  'Invoice Paid',
                                  'You clicked the button!',
                                  'success'
                                )
                               
                       // location.reload(true);
                      
                   }
                   }
                });
           }


            function invoicepaidhistory(billId){
             // var billId=$(this).text();
              //alert(billId);
              $('.modal-title').html('"'+billId+'" bill details information');
              $.ajax({
                url: "{{url('/fees/history/')}}"+'/'+billId,
                data: {
                  format: 'json'
                },
                error: function(error) {
                  alert(JSON.stringify(error));
                  alert("Please fill all inputs correctly!");
                },
                dataType: 'json',
                success: function(data) {
                  console.log(data);
                  $("#billItem").find("tr:gt(0)").remove();
                  for(var i =0;i < data.length;i++)
                  {
                    addRow(data[i],i);
                  }

                },
                type: 'GET'
              });
              $("#billDetails").modal('show');
            }
         
          $( document ).ready(function() {


            @if($student->section=='')
              getsections();
            @endif
           
            $('#class').on('change',function() {
              getsections();
            });
            $('#feeList').dataTable({
               "sPaginationType": "bootstrap",
            });
            
            var session = $('#session').val().trim();
              getstudents();
            $(".datepicker2").datepicker( {
              format: " yyyy", // Notice the Extra space at the beginning
              viewMode: "years",
              minViewMode: "years",
              autoclose:true

            }).on('changeDate', function (ev) {

              //getstudents();

            });

            $('#class').change(function () {
              //getstudents();
            });
            $('#section').change(function () {
              //getstudents();
            });
            $('#shift').change(function () {
              //getstudents();
            });
            $('#student option').filter(function() {
              return ($(this).val() == stdRegiNo); //To select Blue
            }).prop('selected', true);

           

            $(".btninvoice").click(function(){
              var billId=$(this).val();
             // $('.modal-title').html('"'+billId+'" bill details information');
              
              $.ajax({
                url: "{{url('/fees/invoice/details/')}}"+'/'+billId,
                data: {
                  //format: 'json'
                },
                error: function(error) {
                  alert(JSON.stringify(error));
                },
                //dataType: 'json',
                success: function(data) {
                  console.log(data);
                 // $("#moddel").find("tr:gt(0)").remove();
                  $("#moddel").html(data);
                  $("#myModald"+billId).modal('show');
                  

                },
                type: 'GET',

                
              });
              //alert(("#myModald"+billId));
              console.log("#myModald"+billId);
              
            });
          });
          function getstudents()
          {
            var aclass  = $('#class').val();
            var section =  $('#section').val();
            var shift   = 'Morning';
            var session = $('#session').val().trim();
            $.ajax({
              url: "{{url('/student/getList')}}"+'/'+aclass+'/'+section+'/'+shift+'/'+session,
              data: {
                format: 'json'
              },
              error: function(error) {
                alert("Please fill all inputs correctly!");
              },
              dataType: 'json',
              success: function(data) {
                $('#student').empty();
                $('#student').append($('<option>').text("--Select Student--").attr('value',""));
                $.each(data, function(i, student) {
                  //console.log(student);
                  if(student.regiNo==stdRegiNo)
                  {
                    var opt="<option value='"+student.regiNo+"' selected>"+student.firstName+" "+student.middleName+" "+student.lastName+"["+student.rollNo+"] </option>"
                  }
                  else {
                    var opt="<option value='"+student.regiNo+"'>"+student.firstName+" "+student.middleName+" "+student.lastName+"["+student.rollNo+"] </option>"

                  }
                  //console.log(opt);
                  $('#student').append(opt);
                });
                //console.log(data);

              },
              type: 'GET'
            });
          };
          function addRow(data,index) {
            var table = document.getElementById('billItem');
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell2 = row.insertCell(0);
            var title = document.createElement("label");

            title.innerHTML=data['amount'];
            cell2.appendChild(title);

            var cell3 = row.insertCell(1);
            var date1 = document.createElement("label");
            date1.innerHTML=data['date'];
            cell3.appendChild(date1);


           
          };


          function getTXTmonth(mindex)
          {
            if(mindex=="1")
            {
              return "January";
            }
            else if(mindex=="2")
            {
              return "February";
            }
            else if(mindex=="3")
            {
              return "March";
            }
            else if(mindex=="4")
            {
              return "April";
            }
            else if(mindex=="5")
            {
              return "May";
            }
            else if(mindex=="6")
            {
              return "June";
            }
            else if(mindex=="7")
            {
              return "July";
            }
            else if(mindex=="8")
            {
              return "August";
            }
            else if(mindex=="9")
            {
              return "September";
            }
            else if(mindex=="10")
            {
              return "October";
            }
            else if(mindex=="11")
            {
              return "November";
            }
            else if(mindex=="12")
            {
              return "December";
            }
            else {
              return "Not Monthly Fee";
            }


          };

            function getsections()
            {

                var aclass = $('#class').val();
               // alert(aclass);
                $.ajax({
                  url: "{{url('/section/getList')}}"+'/'+aclass,
                  data: {
                    format: 'json'
                  },
                  error: function(error) {
                    alert("Please fill all inputs correctly!");
                  },
                  dataType: 'json',
                  success: function(data) {
                    $('#section').empty();
                   $('#section').append($('<option>').text("--Select Section--").attr('value',""));
                    $.each(data, function(i, section) {
                      //console.log(student);
                     
                      
                        var opt="<option value='"+section.id+"' >"+section.name + " </option>"

                    
                      //console.log(opt);
                      $('#section').append(opt);

                    });
                    //console.log(data);

                  },
                  type: 'GET'
                });
            };

          </script>

          @stop
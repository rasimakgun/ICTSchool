<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use App\SectionModel;
use DB;
class sectionController extends BaseController {

	public function __construct() {
		/*$this->beforeFilter('csrf', array('on'=>'post'));
		$this->beforeFilter('auth');
		$this->beforeFilter('userAccess',array('only'=> array('delete')));*/
		
	       $this->middleware('auth');
           $this->middleware('auth',array('only'=> array('delete')));
	}
	/**
	* Display a listing of the resource.
	*
	* @return Response
	*/
	public function index()
	{
		$class = DB::table('Class')
		->select(DB::raw('name,code'))
		->get();
		return View('app.sectionCreate',compact('class'));
		//echo "this is section controller";
	}
	/**
	* Show the form for creating a new resource.
	*
	* @return Response
	*/
	public function create()
	{
		$rules=[
			'name' => 'required',
			'class'=> 'required',
			'description' => 'required'
		];
		$validator = \Validator::make(Input::all(), $rules);
		if ($validator->fails())
		{
			return Redirect::to('/section/create')->withErrors($validator);
		}
		else {
			$sname = Input::get('name');
			$sexists=SectionModel::select('*')->where('name','=',$sname)->where('class_code','=',Input::get('class'))->get();
			if(count($sexists)>0){

				$errorMessages = new \Illuminate\Support\MessageBag;
				$errorMessages->add('deplicate', 'Section all ready exists!!');
				return Redirect::to('/section/create')->withErrors($errorMessages);
			}
			else {
				$class = new SectionModel;
				$class->name = Input::get('name');
				$class->class_code = Input::get('class');
				$class->description = Input::get('description');
				$class->save();
				return Redirect::to('/section/create')->with("success", "Section Created Succesfully.");
			}

		}

	}
	/**
	* Store a newly created resource in storage.
	*
	* @return Response
	*/
	public function show()
	{
		//$Classes = ClassModel::orderby('code','asc')->get();
		$sections = DB::table('section')
		//->select(DB::raw('section.id,section.class_code,section.name,section.description'))
		->select(DB::raw('section.id,section.class_code,section.name,section.description,(select count(Student.id) from Student where class=section.class_code And section=section.id)as students'))

		->get();
		//dd($sections);
		//return View::Make('app.classList',compact('Classes'));

		//echo "<pre>";print_r($sections);exit;
		return View('app.sectionList',compact('sections'));
	}



	/**
	* Show the form for editing the specified resource.
	*
	* @param  int  $id
	* @return Response
	*/
	public function edit($id)
	{
		$section = SectionModel::find($id);
		$class = DB::table('Class')
		->select(DB::raw('name,code'))
		->get();
		//return View::Make('app.classEdit',compact('class'));
		return View('app.sectionEdit',compact('section','class'));
	}


	/**
	* Update the specified resource in storage.
	*
	* @param  int  $id
	* @return Response
	*/
	public function update()
	{
		$rules=[
			'name' => 'required',
			'description' => 'required'
		];
		$validator = \Validator::make(Input::all(), $rules);
		if ($validator->fails())
		{
			return Redirect::to('/section/edit/'.Input::get('id'))->withErrors($validator);
		}
		else {
			$section = SectionModel::find(Input::get('id'));
			$section->name= Input::get('name');
            $section->class_code = Input::get('class');
			$section->description=Input::get('description');
			$section->save();
			return Redirect::to('/section/list')->with("success","Section Updated Succesfully.");

		}
	}


	/**
	* Remove the specified resource from storage.
	*
	* @param  int  $id
	* @return Response
	*/
	public function delete($id)
	{
		$class = SectionModel::find($id);
		$class->delete();
		return Redirect::to('/section/list')->with("success","Section Deleted Succesfully.");
	}

	public function getsections($class){

      $section= SectionModel::select('id','name')->where('class_code','=',$class)->get();
	return $section;
	}

}

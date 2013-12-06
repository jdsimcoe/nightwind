<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelocations_single extends SectionDatasource {

		public $dsParamROOTELEMENT = 'locations-single';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$title:cannon-beach';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'93' => '{$title:cannon-beach}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description: formatted',
				'hours: formatted',
				'address',
				'city',
				'state',
				'zip',
				'phone',
				'image: caption',
				'image: image'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Locations: Single',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://insomnia.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.4',
				'release-date' => '2013-12-05T00:35:06+00:00'
			);
		}

		public function getSource() {
			return '17';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}

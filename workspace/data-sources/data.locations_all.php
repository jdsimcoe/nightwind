<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelocations_all extends SectionDatasource {

		public $dsParamROOTELEMENT = 'locations-all';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'111' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'hours: formatted',
				'address',
				'city',
				'state',
				'zip',
				'phone',
				'image: image',
				'color'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Locations: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://insomnia.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.4',
				'release-date' => '2013-11-27T23:19:18+00:00'
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

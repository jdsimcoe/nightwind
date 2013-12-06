<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_locations extends SectionDatasource {

		public $dsParamROOTELEMENT = 'events-locations';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'108' => '{$ds-locations-single.system-id}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'location: title',
				'location: color'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-locations-single.system-id');
		}

		public function about() {
			return array(
				'name' => 'Events: Locations',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://insomnia.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.4',
				'release-date' => '2013-11-28T00:41:45+00:00'
			);
		}

		public function getSource() {
			return '18';
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

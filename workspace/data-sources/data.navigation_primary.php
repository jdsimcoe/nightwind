<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcenavigation_primary extends NavigationDatasource {

		public $dsParamROOTELEMENT = 'navigation-primary';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';
		

		public $dsParamFILTERS = array(
				'type' => 'primary',
		);
		

		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Navigation: Primary',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://saplings.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-09-20T16:57:25+00:00'
			);
		}

		public function getSource() {
			return 'navigation';
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

<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestructure_url extends SectionDatasource {

		public $dsParamROOTELEMENT = 'structure-url';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '{$current-path:home}';
		public $dsParamPARAMOUTPUT = array(
				'system:id',
				'slug'
		);
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'122' => '{$current-path:home}',
				'128' => 'yes',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'path',
				'title',
				'slug',
				'parent',
				'tagline-masthead: formatted',
				'page-bar: formatted',
				'content: formatted',
				'hero: caption',
				'hero: image'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Structure: URL',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://nightwind.dev',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.3.4',
				'release-date' => '2014-07-10T19:01:48+00:00'
			);
		}

		public function getSource() {
			return '20';
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

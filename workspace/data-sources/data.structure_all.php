<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcestructure_all extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'structure-all';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'order';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '128' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'slug',
        'hero'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'hero' => array(
            'section_id' => '5',
            'field_id' => '138',
            'elements' => array(
                'image'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Structure: All',
            'author' => array(
                'name' => 'Jonathan Simcoe',
                'website' => 'http://nightwind.dev',
                'email' => 'jonathan@simko.io'),
            'version' => 'Symphony 2.5.0-rc.2',
            'release-date' => '2014-09-04T20:58:20+00:00'
        );
    }

    public function getSource()
    {
        return '20';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}
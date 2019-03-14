<?php
/*========================================================================
#   FileName: mw.php
#     Author: zhenghan.gezh
#      Email: zhenghan.gezh@alibaba-inc.com
# LastChange: 2017-09-08
========================================================================*/
require_once('workflows.php');
class App
{
    private static $_instance;
    private $_workflows;
    function __construct(){
        $this->_workflows = new workflows();
    }

    public static function getInstance()
    {
        if (!self::$_instance instanceof self) {
            self::$_instance = new App();
        }
        return self::$_instance;
    }
    public function request($url)
    {
        return $this->_workflows->request($url);
    }
    public function filterDataList($data)
    {
        $dataList = array();
        //\\2是一个后向引用的示例. 这会告诉pcre它必须匹配正则表达式中第二个圆括号(这里是([\w]+))
        //匹配到的结果. 这里使用两个反斜线是因为这里使用了双引号.
        preg_match_all("/(<(a+)[^>]*>)(.*?)(<\/\\2>)/", $data, $dataList);
        return $dataList[0];
    }
    public function getData($keyword)
    {
        if (stristr("metaq", $keyword)) {
            $keyword = "ons";
        }
        //后面可以在这里加入缓存机制
        //缓存路径$this->_workflows->cache();
        $url = 'http://mw.alibaba-inc.com/ops.html';
        $data = $this->request($url);
        if (isset($data) || empty($data)) {
            $myfile = fopen("mw.htm", "r") or die("Unable to open file!");
            $data = fread($myfile,filesize("mw.htm"));
            fclose($myfile);
        }
        $num = 1;
        foreach( $this->filterDataList($data) as $item ) {
            preg_match('/href="(.*?)"/', $item, $targetUrl);
            preg_match('/>(.*?)</', $item, $title);

            if(!isset($targetUrl[1]) || !isset($title[1])) {
                continue;
             }

            if (stristr($title[1] , $keyword) || stristr($targetUrl[1] , $keyword)) {

                $tiele = $this->_workflows->result($num . "." . time(), $targetUrl[1], $title[1], $targetUrl[1], 'icon.png');
                $num ++;
            }
        }

        if (stristr("mcms", $keyword) || stristr("medusa", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "http://mcms-portal.alibaba-inc.com/", "美杜莎", "http://mcms-portal.alibaba-inc.com/", 'icon.png');
        }
        if (stristr("aone", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "http://aone.alibaba-inc.com/", "Aone", "http://aone.alibaba-inc.com/", 'icon.png');
        }
        if (stristr("idb", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "http://idb.alibaba-inc.com/", "iDB", "http://idb.alibaba-inc.com/", 'icon.png');
        }
        if (stristr("psp", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "http://psp.alibaba-inc.com/", "PSP", "http://psp.alibaba-inc.com/", 'icon.png');
        }
        if (stristr("d2", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "http://d2.alibaba-inc.com/", "在云端", "http://d2.alibaba-inc.com/", 'icon.png');
        }
        if (stristr("ata", $keyword)) {
            $tiele = $this->_workflows->result($num . "." . time(), "https://www.atatech.org/", "ATA", "https://www.atatech.org/", 'icon.png');
        }

        return $this->_workflows->toxml();
    }
    public function run($query)
    {
        return $this->getData($query);
    }
}
#echo App::getInstance()->run('dubbo');
?>
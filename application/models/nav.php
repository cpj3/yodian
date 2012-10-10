<?php
	class Nav extends CI_Model {
	    
	    function __construct(){
	        parent::__construct();
	    }

	    /*
	     * 导航菜单表dili_u_m_nav
	     * @param : $classid 获取导航类型
	     * 这里默认获取主导航（classid=1）, 如果存在其他类型的导航如底部导航(友情链接)，面包屑类型的导航可传入相应分类的classid来获取
	     */
	    function get_nav($classid=1){
	    	$sql = 'SELECT * FROM dili_u_m_nav WHERE classid="'.$classid.'"';
		    $menu = $this->db->query($sql)->result();
		    return $menu;
	    }
	}
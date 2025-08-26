function set_option(select,data)
{
    if(select[0]!= undefined){
        while (select[0].options.length) {
        select[0].remove(0);
    }
        var selectbox = select[0].options;
        for(var i = 0, l = data.length; i < l; i++){
            var option = data[i];
            select[0].options.add( new Option(option.text, option.value, option.selected,option.selected) );
        }
    }
}
function select_desa(link,data){
    var kec_id = data['kec_id'];
    $.getJSON(link+kec_id,function(result){
        var kec_id = data['kec_id'];
        var name = data['kec'];
        $('input[name="kec"]').val(name);
        if(result[kec_id] === undefined){
            var tmp = [{'text':'None','value':'0','selected':'true'}];
        }else{
            var option = result[kec_id];
            var tmp = [{'text':'None','value':'0','selected':'true'}];
            var name = data['desa'];
            $('input[name="desa"]').val(name);
            for(var i =0; i< option.length;i++){
                tmp[i+1] = [];
                if(option[i].id==data.desa_id){
                    tmp[i+1].selected =true;
                }
                tmp[i+1].text = option[i].name;
                tmp[i+1].value = option[i].id;
            }
        }
        set_option($('select[name="desa_id"]'),tmp);
    });
}
$(document).ready(function(){
    var api_provinces = _URL+"/admin/main/get_provinces/";
    var api_regencies = _URL+"/admin/main/get_regencies/";
    var api_districts = _URL+"/admin/main/get_districts/";
    var api_villages = _URL+"/admin/main/get_villages/";
    var api_detail = _URL+"/admin/main/config_json/";
    var data = [];
    $.getJSON(api_detail+'config/'+_NAME,function(result){
        data = result;
    });
    $('select[name="province_id"]').closest('.form-group').append('<span id="load_p">Mengambil Data Provinsi</span>');
    $('select[name="regency_id"]').closest('.form-group').append('<span id="load_r">Mengambil Data Kabupaten</span>');
    $.getJSON(api_provinces,function(result){
        var option = result;
        var tmp = [{'text':'None','value':'0','selected':'true'}];
        for(var i =0; i< option.length;i++){
            tmp[i+1] = [];
            if(option[i].id==data.province_id){
                tmp[i+1].selected =true;
            }
            tmp[i+1].text = option[i].name;
            tmp[i+1].value = option[i].id;
        }
        set_option($('select[name="province_id"]'),tmp);
        $('#load_p').remove();
    });
    $.getJSON(api_regencies,function(result){
        var province_id = data['province_id'];
        if(result[province_id] === undefined){
            var tmp = [{'text':'None','value':'0','selected':'true'}];
        }else{
            var option = result[province_id];
            var tmp = [{'text':'None','value':'0','selected':'true'}];
            var name = data['prov'];
            $('input[name="prov"]').val(name);
            for(var i =0; i< option.length;i++){
                tmp[i+1] = [];
                if(option[i].id==data.regency_id){
                    tmp[i+1].selected =true;
                }
                tmp[i+1].text = option[i].name;
                tmp[i+1].value = option[i].id;
            }
        }
        set_option($('select[name="regency_id"]'),tmp);
        $('select[name="province_id"]').on('change',function(){
            var province_id = $(this).val();
            $('select[name="province_id"] option:selected').each(function(){
                var name = $(this).text();
                $('input[name="prov"]').val(name);
            });
            if(result[province_id] === undefined){
                var tmp = [{'text':'None','value':'0','selected':'true'}];
            }else{
                var option = result[province_id];
                var tmp = [{'text':'None','value':'0','selected':'true'}];
                for(var i =0; i< option.length;i++){
                    tmp[i+1] = [];
                    if(option[i].id==data.regency_id){
                        tmp[i+1].selected =true;
                    }
                    tmp[i+1].text = option[i].name;
                    tmp[i+1].value = option[i].id;
                }
            }
            set_option($('select[name="regency_id"]'),tmp);
        });
        $('#load_r').remove();
    });
    $.getJSON(api_districts,function(result){
        var regency_id = data['regency_id'];
        if(result[regency_id] === undefined){
            var tmp = [{'text':'None','value':'0','selected':'true'}];
        }else{
            var option = result[regency_id];
            var tmp = [{'text':'None','value':'0','selected':'true'}];
            var name = data['kab'];
            $('input[name="kab"]').val(name);
            for(var i =0; i< option.length;i++){
                tmp[i+1] = [];
                if(option[i].id==data.kec_id){
                    tmp[i+1].selected =true;
                }
                tmp[i+1].text = option[i].name;
                tmp[i+1].value = option[i].id;
            }
        }
        set_option($('select[name="kec_id"]'),tmp);
        select_desa(api_villages,data);
        $('select[name="regency_id"]').on('change',function(){
            var regency_id = $(this).val();
            $('select[name="regency_id"] option:selected').each(function(){
                var name = $(this).text();
                $('input[name="kab"]').val(name);
            });
            if(result[regency_id] === undefined){
                var tmp = [{'text':'None','value':'0','selected':'true'}];
            }else{
                var option = result[regency_id];
                var tmp = [{'text':'None','value':'0','selected':'true'}];
                for(var i =0; i< option.length;i++){
                    tmp[i+1] = [];
                    if(option[i].id==data.kec_id){
                        tmp[i+1].selected =true;
                    }
                    tmp[i+1].text = option[i].name;
                    tmp[i+1].value = option[i].id;
                }
            }
            set_option($('select[name="kec_id"]'),tmp);
        });
    });

    $('select[name="kec_id"]').on('change',function(){
        var kec_id = $(this).val();
        $('select[name="kec_id"] option:selected').each(function(){
            var name = $(this).text();
            $('input[name="kec"]').val(name);
        });
        $.getJSON(api_villages+kec_id,function(result){
            if(result[kec_id] === undefined){
                var tmp = [{'text':'None','value':'0','selected':'true'}];
            }else{
                var option = result[kec_id];
                var tmp = [{'text':'None','value':'0','selected':'true'}];
                for(var i =0; i< option.length;i++){
                    tmp[i+1] = [];
                    if(option[i].id==data.desa_id){
                        tmp[i+1].selected =true;
                    }
                    tmp[i+1].text = option[i].name;
                    tmp[i+1].value = option[i].id;
                }
            }
            set_option($('select[name="desa_id"]'),tmp);
        });
    });
    $('select[name="desa_id"]').on('change',function(){
        var desa_id = $(this).val();
        $('select[name="desa_id"] option:selected').each(function(){
            var name = $(this).text();
            $('input[name="desa"]').val(name);
        });
    });
});
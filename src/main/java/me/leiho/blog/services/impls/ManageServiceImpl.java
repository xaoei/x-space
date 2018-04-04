package me.leiho.blog.services.impls;

import me.leiho.blog.services.ManageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ManageServiceImpl implements ManageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private Map<String, Object> map;

    public ManageServiceImpl getValueMap(Map<String, Object> map) {
        this.map = map;
        return this;
    }

    public ManageServiceImpl setPage(String page){
        //通过page设置不同的map
        //todo

        map.put("manage_page",page);
        return this;
    }
}

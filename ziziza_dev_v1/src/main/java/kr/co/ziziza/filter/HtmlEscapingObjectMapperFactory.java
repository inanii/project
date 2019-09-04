package kr.co.ziziza.filter;

import org.springframework.beans.factory.FactoryBean;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HtmlEscapingObjectMapperFactory implements FactoryBean<ObjectMapper> {

    private final ObjectMapper objectMapper;

	public HtmlEscapingObjectMapperFactory() {
        objectMapper = new ObjectMapper();
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

    }

    @Override
    public ObjectMapper getObject() throws Exception {
        return objectMapper;
    }

    @Override
    public Class<?> getObjectType() {
        return ObjectMapper.class;
    }

    @Override
    public boolean isSingleton() {
        return true;
    }

}//class end
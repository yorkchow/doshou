package me.doshou.common.entity.search.exception;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 18:48
 */
public final class InvalidSearchPropertyException extends SearchException {

    public InvalidSearchPropertyException(String searchProperty, String entityProperty) {
        this(searchProperty, entityProperty, null);
    }

    public InvalidSearchPropertyException(String searchProperty, String entityProperty, Throwable cause) {
        super("Invalid Search Property [" + searchProperty + "] Entity Property [" + entityProperty + "]", cause);
    }
}

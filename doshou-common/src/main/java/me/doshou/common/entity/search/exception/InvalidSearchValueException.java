package me.doshou.common.entity.search.exception;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 18:48
 */
public final class InvalidSearchValueException extends SearchException {

    public InvalidSearchValueException(String searchProperty, String entityProperty, Object value) {
        this(searchProperty, entityProperty, value, null);
    }

    public InvalidSearchValueException(String searchProperty, String entityProperty, Object value, Throwable cause) {
        super("Invalid Search Value, searchProperty [" + searchProperty + "], " +
                "entityProperty [" + entityProperty + "], value [" + value + "]", cause);
    }
}

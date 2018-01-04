package onlinemarket.validation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Payload;

@Documented
@Target({ FIELD, METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface BeforeToday {
	String message() default "{BeforeToday.message}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}

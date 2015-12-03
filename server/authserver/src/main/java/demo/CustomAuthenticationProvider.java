package demo;

import org.parse4j.Parse;
import org.parse4j.ParseException;
import org.parse4j.ParseObject;
import org.parse4j.ParseQuery;
import org.parse4j.callback.SaveCallback;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Author:    joechang
 * Created:   11/11/15 10:20 AM
 * Purpose:   Call out to authenticate via touchID
 */
public class CustomAuthenticationProvider implements AuthenticationProvider {
    static {
        Parse.initialize("kP7UvWMLAqRPA3wuMIivT5iTgLvQGEpzvVuIysNL", "Rrv9jMShs0jzkBv9jTDdSU6GtvPG6GZZOjxCzqlV");
    }

    public static final String IS_AUTHORIZED = "isAuthorized";

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();

        //This is where we connect outside and try to get the touchId.
        //if (name.equals("admin") && password.equals("system")) {

        if (performTouchId(name)) {
            List<GrantedAuthority> grantedAuths = new ArrayList<>();
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
            Authentication auth = new UsernamePasswordAuthenticationToken(name, password, grantedAuths);
            return auth;
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    public boolean performTouchId(String name) {
        try {
            ParseObject touchIdAuth = new ParseObject("Authorization");
            touchIdAuth.put("isAuthorized", "false");
            touchIdAuth.put("siteName", "joeloco");
            touchIdAuth.put("siteURL", "http://localhost:8080");
            touchIdAuth.put(IS_AUTHORIZED, false);
            touchIdAuth.save();

            final String nowWaitId = touchIdAuth.getObjectId();

            //HACK: Wait until this is now AUTHED.
            ExecutorService es = Executors.newSingleThreadExecutor();
            Future<ParseObject> t = es.submit(new Callable<ParseObject>() {
                @Override
                public ParseObject call() throws Exception {
                    for (int i=0; i<30; i++) {
                        ParseQuery<ParseObject> query = ParseQuery.getQuery("Authorization");
                        ParseObject poed = query.get(nowWaitId);
                        if (poed != null) {
                            Boolean status = poed.getBoolean(IS_AUTHORIZED);
                            if (status == true) {
                                return poed;
                            }
                        }
                        TimeUnit.SECONDS.sleep(2);
                    }
                    return null;
                }
            });

            while (!t.isDone()) {
                TimeUnit.SECONDS.sleep(1);
            }

            ParseObject poResult = t.get();
            es.shutdown();

            if (poResult != null) {
                return poResult.getBoolean(IS_AUTHORIZED);
            }

        } catch (Exception e) {
            Logger.getLogger(CustomAuthenticationProvider.class.getName()).log(Level.SEVERE, "uhoh", e);
        }

        return false;
    }
}

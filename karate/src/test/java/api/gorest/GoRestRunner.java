package api.gorest;

import com.intuit.karate.junit5.Karate;

class GoRestRunner {

    @Karate.Test
    Karate testGoRest() {
        return Karate.run("goRest").relativeTo(getClass());
    }

}

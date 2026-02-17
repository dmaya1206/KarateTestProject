package features.gets;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static features.util.ReportUtil.generateCucumberReport;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class getsTestRunner {

    final static Logger looger = LoggerFactory.getLogger(getsTestRunner.class);

    @Test
    void testGets() {
        looger.info("Running Api test for gets");
        Results results =
                Runner.path("classpath:features/gets/api_mascotas_usuarios.feature")
//                        .tags("~@ignore")
                        .tags("@MethodAddUserPetStore")
                        .outputCucumberJson(true)
                        .parallel(4);
        generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
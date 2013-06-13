package com.github.fbiville.liquibase.run_always;

import com.esotericsoftware.wildcard.Paths;
import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

import static java.lang.Integer.parseInt;
import static org.assertj.core.api.Assertions.assertThat;


public class RunAlwaysChangesetsIT {

    private final static String BASE_DIR = System.getProperty("user.dir");
    private final static String CHANGESET_LOCATIONS =  BASE_DIR +
        "/src/main/resources/com/github/fbiville/liquibase/run_always/";

    @Test
    public void should_always_have_attribute_run_on_change_set_to_true() throws Exception {
        List<File> changesets = new Paths().regex(CHANGESET_LOCATIONS, ".*\\.xml", "!master\\.xml").filesOnly().getFiles();
        assertThat(changesets.size()).isPositive();

        for (File migrationFile : changesets) {
            assertThatAllChangesetAlwaysRun(migrationFile);
        }

    }

    private void assertThatAllChangesetAlwaysRun(File migrationFile) throws SAXException, IOException, ParserConfigurationException, XPathExpressionException {
        XPathCountEvaluator evaluator = new XPathCountEvaluator(migrationFile.getAbsolutePath());

        int total = evaluator.evaluate("count(/databaseChangeLog/changeSet)");
        int runAlwaysTotal = evaluator.evaluate("count(/databaseChangeLog/changeSet[@runAlways='true'])");

        assertThat(total).isEqualTo(runAlwaysTotal);
    }
}

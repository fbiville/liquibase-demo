package com.github.fbiville.liquibase.run_always;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.*;

import java.io.IOException;

import static javax.xml.xpath.XPathConstants.NUMBER;

/**
 * This class is dedicated to ease the interaction with XPath API
 * regarding the expression count.
 */
public class XPathCountEvaluator {

    private final Document document;

    public XPathCountEvaluator(String path) throws ParserConfigurationException, IOException, SAXException {
        this.document = newDocumentBuilder().parse(path);
    }

    /**
     * Returns the result of the count expression
     */
    public int evaluate(String xpathCountExpression) throws XPathExpressionException {
        XPathExpression expression = XPathFactory.newInstance().newXPath().compile(xpathCountExpression);
        return ((Double) expression.evaluate(document, NUMBER)).intValue();
    }

    private DocumentBuilder newDocumentBuilder() throws ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        return factory.newDocumentBuilder();
    }
}

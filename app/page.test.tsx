/**
 * @jest-environment jsdom
 */
import { render, screen } from "@testing-library/react";
import Page from "./page";

it("should fail this test intentionally", () => {
  expect("hello world").toBe("hello world");
});
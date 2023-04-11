var A = Object.defineProperty;
var w = (o, t, e) => (t in o ? A(o, t, { enumerable: !0, configurable: !0, writable: !0, value: e }) : (o[t] = e));
var P = (o, t, e) => (w(o, typeof t != "symbol" ? t + "" : t, e), e);
import { R as f, d as I, y as $, C as y, a7 as U, r as m, o as j, c as q, a as u, w as a, i as F, u as L, f as R, m as h } from "./index-1d0f4517.js";
import { C as N } from "./CodeGenerationService-52670eca.js";
class p {
  static findList(t, e, v = {}, c = []) {
    return f.post(`${this.urlPrefix}/findList`, { page: t, size: e, search: v, searchSort: c });
  }
  static deleteList(t) {
    return f.post(`${this.urlPrefix}/deleteList`, t);
  }
  static findForm(t) {
    return f.get(`${this.urlPrefix}/findForm${t ? "/" + t : ""}`);
  }
  static saveForm(t, e) {
    return f.post(`${this.urlPrefix}/${t ? "update" : "create"}`, e);
  }
  static synchronization() {
    return f.post(`${this.urlPrefix}/synchronization`);
  }
  static change(t) {
    return f.post(`${this.urlPrefix}/change`, t);
  }
}
P(p, "urlPrefix", "/api/v1/admin/LowCodeTable");
const S = { class: "text-center mt-48" },
  z = I({
    __name: "CodeLoadToProject",
    props: { rowData: null },
    setup(o) {
      const t = o,
        e = $({ vm: { id: "", form: {} }, loading: !1 }),
        v = y(),
        c = {
          projectRootPath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u9879\u76EE\u6839\u5730\u5740", trigger: "blur" }],
          modelPath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u5B9E\u4F53\u4FDD\u5B58\u8DEF\u5F84", trigger: "blur" }],
          servicePath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u670D\u52A1\u4FDD\u5B58\u8DEF\u5F84", trigger: "blur" }],
          controllerPath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u63A7\u5236\u5668\u4FDD\u5B58\u8DEF\u5F84", trigger: "blur" }],
          indexVuePath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u524D\u7AEF\u89C6\u56FE\u4FDD\u5B58\u8DEF\u5F84", trigger: "blur" }],
          infoVuePath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u524D\u7AEF\u4FE1\u606F\u5F39\u7A97\u4FDD\u5B58\u4F4D\u7F6E", trigger: "blur" }],
          serviceJsPath: [{ required: !0, message: "\u8BF7\u8F93\u5165\u524D\u7AEF\u670D\u52A1\u4FDD\u5B58\u4F4D\u7F6E", trigger: "blur" }],
        };
      U(() => {
        t.rowData && E();
      }, t.rowData);
      async function E() {
        e.loading = !0;
        const n = await p.findForm(t.rowData.id);
        (e.loading = !1), n.code == 1 && (e.vm = n.data);
      }
      function _() {
        var n;
        (n = v.value) == null ||
          n.validate().then(() => {
            (e.loading = !0),
              p
                .saveForm(e.vm.id, e.vm)
                .then((r) => {
                  (e.loading = !1), r.code == 1 && h.message.success("\u64CD\u4F5C\u6210\u529F!");
                })
                .finally(() => {
                  e.loading = !1;
                });
          });
      }
      async function x() {
        e.loading = !0;
        const n = await N.autoImprotProject({ tableName: t.rowData.tableName });
        (e.loading = !1), n.code === 1 && h.message.success("\u5BFC\u5165\u9879\u76EE\u5DE5\u7A0B\u6210\u529F!");
      }
      return (n, r) => {
        const D = m("a-radio"),
          B = m("a-radio-group"),
          s = m("a-form-item"),
          i = m("a-col"),
          d = m("a-input"),
          b = m("a-row"),
          C = m("a-form"),
          g = m("a-button");
        return (
          j(),
          q("div", null, [
            u(
              C,
              { ref: "formRef", layout: "vertical", model: e.vm.form, rules: L(c) },
              {
                default: a(() => [
                  u(
                    b,
                    { gutter: [15, 15] },
                    {
                      default: a(() => [
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u662F\u5426\u8986\u76D6", ref: "isCover", name: "isCover" },
                                {
                                  default: a(() => [
                                    u(
                                      B,
                                      { value: e.vm.form.isCover, "onUpdate:value": r[0] || (r[0] = (l) => (e.vm.form.isCover = l)), name: "isCover" },
                                      { default: a(() => [u(D, { value: !0 }, { default: a(() => [F("\u662F")]), _: 1 }), u(D, { value: !1 }, { default: a(() => [F("\u5426")]), _: 1 })]), _: 1 },
                                      8,
                                      ["value"]
                                    ),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u9879\u76EE\u6839\u5730\u5740", ref: "projectRootPath", name: "projectRootPath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.projectRootPath, "onUpdate:value": r[1] || (r[1] = (l) => (e.vm.form.projectRootPath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, [
                                      "value",
                                    ]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u5B9E\u4F53\u4FDD\u5B58\u8DEF\u5F84", ref: "modelPath", name: "modelPath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.modelPath, "onUpdate:value": r[2] || (r[2] = (l) => (e.vm.form.modelPath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, ["value"]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u670D\u52A1\u4FDD\u5B58\u8DEF\u5F84", ref: "servicePath", name: "servicePath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.servicePath, "onUpdate:value": r[3] || (r[3] = (l) => (e.vm.form.servicePath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, [
                                      "value",
                                    ]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u63A7\u5236\u5668\u4FDD\u5B58\u8DEF\u5F84", ref: "controllerPath", name: "controllerPath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.controllerPath, "onUpdate:value": r[4] || (r[4] = (l) => (e.vm.form.controllerPath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, [
                                      "value",
                                    ]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u524D\u7AEF\u89C6\u56FE\u4FDD\u5B58\u8DEF\u5F84", ref: "clientIndexPath", name: "clientIndexPath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.clientIndexPath, "onUpdate:value": r[5] || (r[5] = (l) => (e.vm.form.clientIndexPath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, [
                                      "value",
                                    ]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u524D\u7AEF\u4FE1\u606F\u5F39\u7A97\u4FDD\u5B58\u4F4D\u7F6E", ref: "clientInfoPath", name: "clientInfoPath" },
                                {
                                  default: a(() => [
                                    u(d, { value: e.vm.form.clientInfoPath, "onUpdate:value": r[6] || (r[6] = (l) => (e.vm.form.clientInfoPath = l)), placeholder: "\u8BF7\u8F93\u5165" }, null, 8, [
                                      "value",
                                    ]),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                        u(
                          i,
                          { xs: 24, sm: 12, md: 12, lg: 12, xl: 12 },
                          {
                            default: a(() => [
                              u(
                                s,
                                { label: "\u524D\u7AEF\u670D\u52A1\u4FDD\u5B58\u4F4D\u7F6E", ref: "clientServicePath", name: "clientServicePath" },
                                {
                                  default: a(() => [
                                    u(
                                      d,
                                      { value: e.vm.form.clientServicePath, "onUpdate:value": r[7] || (r[7] = (l) => (e.vm.form.clientServicePath = l)), placeholder: "\u8BF7\u8F93\u5165" },
                                      null,
                                      8,
                                      ["value"]
                                    ),
                                  ]),
                                  _: 1,
                                },
                                512
                              ),
                            ]),
                            _: 1,
                          }
                        ),
                      ]),
                      _: 1,
                    }
                  ),
                ]),
                _: 1,
              },
              8,
              ["model", "rules"]
            ),
            R("div", S, [
              u(g, { onClick: r[8] || (r[8] = (l) => _()), class: "mr-24" }, { default: a(() => [F("\u63D0\u4EA4")]), _: 1 }),
              u(g, { type: "primary", onClick: r[9] || (r[9] = (l) => x()) }, { default: a(() => [F("\u4EE3\u7801\u8F7D\u5165\u9879\u76EE")]), _: 1 }),
            ]),
          ])
        );
      };
    },
  });
export { p as L, z as _ };

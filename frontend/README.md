# Frontend (SPA)

지도 렌더링, 카테고리 선택 UI, 장소/경로 패널을 담당하는 반응형 SPA (TRD 3장 기술 스택 후보 참고).

## 구조

- `src/components/map` - 지도 렌더링, 마커, 경로 표시 (FR-1, FR-8~FR-11, FR-17)
- `src/components/category` - 카테고리 선택 UI (FR-3, PRD 6장)
- `src/components/place` - 장소 결과 목록·상세 패널 (FR-6, FR-7)
- `src/components/route` - 경로 비교/상세 패널 (FR-12~FR-19)
- `src/pages` - 화면 단위 페이지 (PRD 10장 주요 화면)
- `src/hooks` - 지도 이벤트, 위치 정보 등 커스텀 훅
- `src/services` - 백엔드 API 프록시 호출 클라이언트 (TRD 2장)
- `src/types` - 프론트엔드 전용 타입 (shared 스키마 확장)
- `src/styles` - 지도 스타일링, 공통 스타일
- `src/utils` - 공통 유틸리티
- `public` - 정적 자산

외부 지도 API의 공개 JS 키는 도메인 제한을 건 상태로 클라이언트에서 직접 사용하고,
비밀 키가 필요한 호출(장소 검색, 경로 계산)은 `services`를 통해 백엔드를 경유합니다 (TRD 2장).

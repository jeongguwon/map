# Backend (API 프록시)

외부 API 비밀 키 보관, 요청 검증, 응답 정규화(어댑터 패턴), 캐싱, 호출량 제한을 담당 (TRD 2장, 4장).

## 구조

- `src/routes` - 프론트엔드가 호출하는 내부 API 엔드포인트 (장소 검색, 경로 계산)
- `src/providers/placeSearch` - 지도·장소 검색 API 어댑터 (`PlaceSearchProvider`, TRD 4.1)
- `src/providers/walkingRoute` - 도보 경로 API 어댑터 (`WalkingRouteProvider`, TRD 4.1)
- `src/providers/transit` - 대중교통 API 어댑터 (3단계, TRD 6장 확장성)
- `src/middleware` - 요청 검증, CORS, 호출량 제한(rate limit) (TRD 6장, 7장)
- `src/cache` - 응답 캐시 계층 (인메모리 → Redis, TRD 3장)
- `src/config` - 환경 변수·API 키 로딩 (TRD 7장 보안 요구사항)
- `src/types` - 백엔드 전용 타입 (shared 스키마 확장)

제공사별 응답 스키마 차이는 각 provider 어댑터 내부에서 `shared/types`의 공통 스키마로 변환합니다 (TRD 4.1, 5장).
